---
- dashboard: profit_teller_dashboard
  title: Profit Teller Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: McZo7Z2wMbwDaA84QNjTCr
  elements:
  - title: Predicted vs Actual Net Sales by Product Area
    name: Predicted vs Actual Net Sales by Product Area
    model: fortune_teller_main
    explore: orders
    type: looker_column
    fields: [predictions.predicted_order_items_net_sales, order_items.net_sales, products.area]
    filters: {}
    sorts: [prediction_absolute_percentage_error desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: abs(${order_items.net_sales}-${predictions.predicted_order_items_net_sales})/${order_items.net_sales}
      label: prediction absolute percentage error
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: prediction_absolute_percentage_error
      _type_hint: number
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: predictions.predicted_order_items_net_sales,
            id: predictions.predicted_order_items_net_sales, name: Predicted Net Sales},
          {axisId: order_items.net_sales, id: order_items.net_sales, name: Net Sales}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: prediction_absolute_percentage_error, id: prediction_absolute_percentage_error,
            name: prediction absolute percentage error}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      prediction_absolute_percentage_error: line
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    listen:
      Model Name: predictions.model_name
      Created Date: order_items.created_date
    row: 21
    col: 0
    width: 9
    height: 9
  - title: Predicted Net Sales by Age Group and Gender
    name: Predicted Net Sales by Age Group and Gender
    model: fortune_teller_main
    explore: orders
    type: looker_grid
    fields: [customers.age_group, customers.gender, predictions.predicted_order_items_net_sales]
    filters:
      predictions.model_name: '"profit_teller"'
    sorts: [predictions.predicted_order_items_net_sales desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: adult group (30s)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: adult_group_30s
      args:
      - customers.age_group
      - - label: test
          filter: Adult (30s)
      -
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", customers.age_group, customers.gender, predictions.predicted_order_items_net_sales]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_column_widths:
      customers.age_group: 172
      customers.gender: 94
      predictions.predicted_order_items_net_sales: 976
    series_cell_visualizations:
      predictions.predicted_order_items_net_sales:
        is_active: true
    defaults_version: 1
    interpolation: linear
    listen:
      Created Date: order_items.created_date
    row: 10
    col: 0
    width: 18
    height: 8
  - title: Predicted Net Sales
    name: Predicted Net Sales
    model: fortune_teller_main
    explore: orders
    type: single_value
    fields: [predictions.predicted_order_items_net_sales]
    filters:
      predictions.model_name: '"profit_teller"'
    sorts: [predictions.predicted_order_items_net_sales desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: adult group (30s)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: adult_group_30s
      args:
      - customers.age_group
      - - label: test
          filter: Adult (30s)
      -
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", customers.age_group, customers.gender, predictions.predicted_order_items_net_sales]
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_column_widths:
      predictions.predicted_order_items_net_sales: 976
    series_cell_visualizations:
      predictions.predicted_order_items_net_sales:
        is_active: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    interpolation: linear
    listen:
      Created Date: order_items.created_date
    row: 4
    col: 0
    width: 5
    height: 6
  - title: Daily Predicted Net Sales Trend
    name: Daily Predicted Net Sales Trend
    model: fortune_teller_main
    explore: orders
    type: looker_line
    fields: [predictions.predicted_order_items_net_sales, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      predictions.model_name: '"profit_teller"'
    sorts: [predictions.predicted_order_items_net_sales desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: adult group (30s)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: adult_group_30s
      args:
      - customers.age_group
      - - label: test
          filter: Adult (30s)
      -
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", customers.age_group, customers.gender, predictions.predicted_order_items_net_sales]
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_column_widths:
      predictions.predicted_order_items_net_sales: 976
    series_cell_visualizations:
      predictions.predicted_order_items_net_sales:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Created Date: order_items.created_date
    row: 4
    col: 5
    width: 19
    height: 6
  - title: Predicted vs Actual Net Sales Over Time
    name: Predicted vs Actual Net Sales Over Time
    model: fortune_teller_main
    explore: orders
    type: looker_line
    fields: [order_items.created_date, predictions.predicted_order_items_net_sales,
      order_items.net_sales]
    fill_fields: [order_items.created_date]
    filters:
      predictions.model_name: '"profit_teller"'
    sorts: [order_items.created_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: adult group (30s)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: adult_group_30s
      args:
      - customers.age_group
      - - label: test
          filter: Adult (30s)
      -
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: "(${order_items.net_sales}-${predictions.predicted_order_items_net_sales})/${order_items.net_sales}"
      label: Prediction Percentage Error
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: prediction_percentage_error
      _type_hint: number
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: predictions.predicted_order_items_net_sales,
            id: predictions.predicted_order_items_net_sales, name: Predicted Net Sales},
          {axisId: order_items.net_sales, id: order_items.net_sales, name: Net Sales}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: prediction_percentage_error, id: prediction_percentage_error,
            name: prediction percentage error}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", customers.age_group, customers.gender, predictions.predicted_order_items_net_sales]
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_column_widths:
      predictions.predicted_order_items_net_sales: 976
    series_cell_visualizations:
      predictions.predicted_order_items_net_sales:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Created Date: order_items.created_date
    row: 21
    col: 9
    width: 15
    height: 9
  - title: Sales Prediction by Traffic Source
    name: Sales Prediction by Traffic Source
    model: fortune_teller_main
    explore: orders
    type: looker_pie
    fields: [predictions.predicted_order_items_net_sales, customers.traffic_source]
    filters:
      predictions.model_name: '"profit_teller"'
    sorts: [predictions.predicted_order_items_net_sales desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: adult group (30s)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: adult_group_30s
      args:
      - customers.age_group
      - - label: test
          filter: Adult (30s)
      -
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: "(${order_items.net_sales}-${predictions.predicted_order_items_net_sales})/${order_items.net_sales}"
      label: Prediction Percentage Error
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: prediction_percentage_error
      _type_hint: number
      is_disabled: true
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 41
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors:
      Facebook: "#7CC8FA"
      Organic: "#f56776"
      Email: "#10C871"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: predictions.predicted_order_items_net_sales,
            id: predictions.predicted_order_items_net_sales, name: Predicted Net Sales},
          {axisId: order_items.net_sales, id: order_items.net_sales, name: Net Sales}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: prediction_percentage_error, id: prediction_percentage_error,
            name: prediction percentage error}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", customers.age_group, customers.gender, predictions.predicted_order_items_net_sales]
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_column_widths:
      predictions.predicted_order_items_net_sales: 976
    series_cell_visualizations:
      predictions.predicted_order_items_net_sales:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_pivots: {}
    listen:
      Created Date: order_items.created_date
    row: 10
    col: 18
    width: 6
    height: 8
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"62u5u"},{"type":"p","children":[{"text":""}],"id":"12nhs"},{"children":[{"text":"Prediction
      Error Rate","bold":true}],"type":"h2","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 18
    col: 7
    width: 10
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Profit Teller"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"begxr","align":"center"},{"type":"p","children":[{"text":"This
      dashboard offers insights into the predictions made by the \"profit_teller\"
      model, which forecasts net sales performance and evaluates prediction accuracy
      across various dimensions. \nLeverage this dashboard to understand sales trends,
      demographic impacts, and prediction errors. \nUse the insights to optimize marketing
      strategies, inventory planning, and overall decision-making to enhance profitability
      and operational efficiency."}],"id":"otqat","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 4
  filters:
  - name: Model Name
    title: Model Name
    type: field_filter
    default_value: '"profit_teller"'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: fortune_teller_main
    explore: orders
    listens_to_filters: []
    field: predictions.model_name
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: last month
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: fortune_teller_main
    explore: orders
    listens_to_filters: []
    field: order_items.created_date
