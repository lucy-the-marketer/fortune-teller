- dashboard: return_teller
  title: Return Teller
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: MJBTzJDdhQyYJANxv0HAYp
  elements:
  - title: Predicted Return Probability Across Product Categories and Age Groups
    name: Predicted Return Probability Across Product Categories and Age Groups
    model: fortune_teller_main
    explore: orders
    type: looker_scatter
    fields: [customers.age_group, products.category, predictions.predicted_is_returned]
    pivots: [customers.age_group]
    filters:
      predictions.model_name: '"return_teller"'
      orders.status: "-Processing,-Shipped"
    sorts: [customers.age_group, predictions.predicted_is_returned desc 0]
    limit: 5000
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Ordered at: order_items.created_date
      Country: customers.country
      Gender: customers.gender
      Traffic Source: customers.traffic_source
    row: 11
    col: 11
    width: 13
    height: 12
  - title: Predicted Return Rate by Country
    name: Predicted Return Rate by Country
    model: fortune_teller_main
    explore: orders
    type: looker_geo_choropleth
    fields: [predictions.predicted_is_returned, customers.country]
    filters:
      predictions.model_name: '"return_teller"'
      customers.country: ''
    sorts: [predictions.predicted_is_returned desc]
    limit: 5000
    column_limit: 50
    query_timezone: America/Los_Angeles
    map: world
    map_projection: ''
    show_view_names: true
    quantize_colors: false
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    listen:
      Ordered at: order_items.created_date
      Gender: customers.gender
      Traffic Source: customers.traffic_source
    row: 11
    col: 0
    width: 11
    height: 12
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Return Teller"}],"align":"center"},{"type":"p","children":[{"text":"\n","bold":true},{"text":"\nThis
      dashboard provides insights into the predictions made by the \"return_teller\"
      model, which forecasts whether an order will be returned. \nUtilize this dashboard
      to understand model performance, key factors influencing returns, and to monitor
      real-time predictions to improve decision-making and operational efficiency."}],"id":"czwrm","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Predicted Total Returns
    name: Predicted Total Returns
    model: fortune_teller_main
    explore: orders
    type: single_value
    fields: [order_items.id, customers.age_group, customers.gender, customers.traffic_source,
      products.category, order_items.is_returned, products.average_item_price, predictions.predicted_is_returned_binary]
    filters:
      predictions.model_name: '"return_teller"'
      orders.status: ''
    sorts: [products.average_item_price desc]
    limit: 5000
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: max(running_total(${predictions.predicted_is_returned_binary}))
      label: Total Predicted Returns
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_predicted_returns
      _type_hint: number
      is_disabled: false
    - category: table_calculation
      expression: max(running_total(${order_items.is_returned}))
      label: Total Actual Returns
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: dimension
      table_calculation: total_actual_returns
      _type_hint: number
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
    value_format: "#,##0"
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
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
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    x_axis_zoom: true
    y_axis_zoom: true
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
    hidden_pivots: {}
    hidden_fields: [customers.age_group, customers.gender, customers.traffic_source,
      products.category, products.average_item_price, order_items.id, order_items.is_returned,
      predictions.predicted_is_returned_binary, total_actual_returns]
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Ordered at: order_items.created_date
      Country: customers.country
      Gender: customers.gender
      Traffic Source: customers.traffic_source
    row: 4
    col: 20
    width: 4
    height: 4
  - title: Daily Predicted Return Probability
    name: Daily Predicted Return Probability
    model: fortune_teller_main
    explore: orders
    type: looker_line
    fields: [predictions.predicted_is_returned, order_items.created_date, customers.traffic_source]
    pivots: [customers.traffic_source]
    filters:
      predictions.model_name: '"return_teller"'
      orders.status: ''
      customers.country: ''
      order_items.created_date: 7 days
      customers.gender: ''
      customers.traffic_source: ''
    sorts: [customers.traffic_source, order_items.created_date]
    limit: 5000
    column_limit: 50
    total: true
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    value_format: "#,##0"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
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
    hidden_pivots: {}
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 11
    height: 7
  - title: High Predicted Returns Overview
    name: High Predicted Returns Overview
    model: fortune_teller_main
    explore: orders
    type: looker_grid
    fields: [customers.age_group, customers.gender, customers.traffic_source, predictions.predicted_is_returned]
    filters:
      predictions.model_name: '"return_teller"'
      orders.status: ''
      customers.country: ''
      order_items.created_date: 7 days
      customers.gender: ''
      customers.traffic_source: ''
    sorts: [predictions.predicted_is_returned desc]
    limit: 5000
    column_limit: 50
    total: true
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
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
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    value_format: "#,##0"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
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
    hidden_pivots: {}
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen: {}
    row: 4
    col: 11
    width: 9
    height: 7
  - title: Actual Total Returns
    name: Actual Total Returns
    model: fortune_teller_main
    explore: orders
    type: single_value
    fields: [order_items.return_count]
    filters:
      predictions.model_name: '"return_teller"'
      orders.status: ''
    limit: 5000
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: max(running_total(${predictions.predicted_is_returned_binary}))
      label: Total Predicted Returns
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_predicted_returns
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: max(running_total(${order_items.is_returned}))
      label: Total Actual Returns
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: dimension
      table_calculation: total_actual_returns
      _type_hint: number
      is_disabled: true
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
    value_format: "#,##0"
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
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
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    x_axis_zoom: true
    y_axis_zoom: true
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
    hidden_pivots: {}
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Ordered at: order_items.created_date
      Country: customers.country
      Gender: customers.gender
      Traffic Source: customers.traffic_source
    row: 8
    col: 20
    width: 4
    height: 3
  filters:
  - name: Model Name
    title: Model Name
    type: field_filter
    default_value: '"return_teller"'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: fortune_teller_main
    explore: orders
    listens_to_filters: []
    field: predictions.model_name
  - name: Ordered at
    title: Ordered at
    type: field_filter
    default_value: 7 day
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
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: fortune_teller_main
    explore: orders
    listens_to_filters: []
    field: customers.country
  - name: Gender
    title: Gender
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: fortune_teller_main
    explore: orders
    listens_to_filters: []
    field: customers.gender
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: fortune_teller_main
    explore: orders
    listens_to_filters: []
    field: customers.traffic_source
