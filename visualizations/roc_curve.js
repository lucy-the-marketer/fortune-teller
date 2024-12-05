// Register the custom visualization
looker.plugins.visualizations.add({
    id: "roc_curve",
    label: "ROC Curve",
    options: {},
    create: function (element, config) {
      // Initialize the container
      element.innerHTML = "";
      this.container = element.appendChild(document.createElement("div"));
      this.container.style.width = "100%";
      this.container.style.height = "100%";
    },
    updateAsync: function (data, element, config, queryResponse, details, done) {
      // Validate the required fields
      if (queryResponse.fields.dimensions.length < 2) {
        this.addError({
          title: "Missing Required Fields",
          message: "Two dimensions are required for this visualization.",
        });
        return;
      }
  
      // Process the data and render the visualization
      renderROCCurve(this.container, data, queryResponse);
  
      done();
    },
  });
  
  // Function to render the ROC Curve
  function renderROCCurve(container, data, queryResponse) {
    // Clear existing visualization
    container.innerHTML = "";
  
    // Extract the actual labels and predicted probabilities
    const actualLabels = data.map((d) =>
      d[queryResponse.fields.dimensions[0].name].value ? 1 : 0
    );
    const predictedProbabilities = data.map(
      (d) => d[queryResponse.fields.dimensions[1].name].value
    );
  
    // Calculate ROC Curve data points
    const rocData = calculateROCCurve(actualLabels, predictedProbabilities);
  
    // Use D3.js to draw the ROC Curve
    drawROCCurve(container, rocData);
  }
  
  // Function to calculate ROC Curve data points
  function calculateROCCurve(actualLabels, predictedProbabilities) {
    // Combine actual labels and predicted probabilities into a single array
    const combinedData = actualLabels.map((label, index) => {
      return { label: label, score: predictedProbabilities[index] };
    });
  
    // Sort the combined data by predicted probabilities in descending order
    combinedData.sort((a, b) => b.score - a.score);
  
    let tp = 0; // True positives
    let fp = 0; // False positives
    const tpTotal = combinedData.filter((d) => d.label === 1).length; // Total positives
    const fpTotal = combinedData.filter((d) => d.label === 0).length; // Total negatives
  
    const rocPoints = [];
  
    // Calculate TPR and FPR for each threshold
    combinedData.forEach((dataPoint, index) => {
      if (dataPoint.label === 1) {
        tp += 1;
      } else {
        fp += 1;
      }
  
      rocPoints.push({
        tpr: tp / tpTotal, // True Positive Rate
        fpr: fp / fpTotal, // False Positive Rate
      });
    });
  
    // Add starting and ending points for the curve
    rocPoints.unshift({ tpr: 0, fpr: 0 });
    rocPoints.push({ tpr: 1, fpr: 1 });
  
    return rocPoints;
  }
  
  // Function to draw the ROC Curve using D3.js
  function drawROCCurve(container, rocData) {
    const width = container.clientWidth;
    const height = container.clientHeight;
  
    // Create an SVG element
    const svg = d3
      .select(container)
      .append("svg")
      .attr("width", width)
      .attr("height", height);
  
    // Define scales for the axes
    const xScale = d3.scaleLinear().domain([0, 1]).range([50, width - 20]);
    const yScale = d3.scaleLinear().domain([0, 1]).range([height - 30, 20]);
  
    // Add X-axis
    const xAxis = d3.axisBottom(xScale);
    svg
      .append("g")
      .attr("transform", `translate(0, ${height - 30})`)
      .call(xAxis);
  
    // Add Y-axis
    const yAxis = d3.axisLeft(yScale);
    svg
      .append("g")
      .attr("transform", `translate(50, 0)`)
      .call(yAxis);
  
    // Draw the ROC Curve
    const line = d3
      .line()
      .x((d) => xScale(d.fpr))
      .y((d) => yScale(d.tpr));
  
    svg
      .append("path")
      .datum(rocData)
      .attr("d", line)
      .attr("stroke", "steelblue")
      .attr("stroke-width", 2)
      .attr("fill", "none");
  
    // Add a diagonal baseline (random guess line)
    svg
      .append("line")
      .attr("x1", xScale(0))
      .attr("y1", yScale(0))
      .attr("x2", xScale(1))
      .attr("y2", yScale(1))
      .attr("stroke", "gray")
      .attr("stroke-dasharray", "5,5");
  
    // Add labels for the axes
    svg
      .append("text")
      .attr("x", width / 2)
      .attr("y", height)
      .attr("text-anchor", "middle")
      .text("False Positive Rate");
  
    svg
      .append("text")
      .attr("transform", "rotate(-90)")
      .attr("x", -height / 2)
      .attr("y", 15)
      .attr("text-anchor", "middle")
      .text("True Positive Rate");
  
    // Add a title
    svg
      .append("text")
      .attr("x", width / 2)
      .attr("y", 20)
      .attr("text-anchor", "middle")
      .attr("font-size", "16px")
      .text("ROC Curve");
  }
  