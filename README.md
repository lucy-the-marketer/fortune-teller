# Fortune Teller

Fortune Teller uses the Looker Action API's [BigQuery ML Generator](https://github.com/looker-open-source/bqml-actions?tab=readme-ov-file#creating-bigquery-ml-models) to enable users to create and train machine learning models directly within Looker. This integration allows anyone to perform machine learning predictions using BigQuery ML without the need for separate data movement or complex setups.

## Features

- **Easy Model Creation**: Select input features and choose the type of model you want to train.
- **Real-Time Predictions**: Use the generated models to perform real-time predictions and include them in your dashboards.

## Example Models

1. **Logistic Classification**: Predicting the return status (`is_returned`) of orders. [Dashboard Return Teller](https://hack.looker.com/dashboards/fortune_teller_main::return_teller?Model+Name=%22return_teller%22&Ordered+at=7+day&Country=&Gender=&Traffic+Source=)

![image](https://github.com/user-attachments/assets/1ef313d0-9fc3-4b07-90a1-455ce697a97c)


2. **Linear Regression**: Predicting `net_sales`. [Dashboard Profit Teller](https://hack.looker.com/dashboards/fortune_teller_main::profit_teller_dashboard?Model+Name=%22profit_teller%22&Created+Date=last+month)

![image](https://github.com/user-attachments/assets/b82914ee-21e4-4ffe-a4d9-583a6049e885)

## How to Create a Model

1. In **Explore**, select all the variables you want to train, including the target variable.
2. Click the **gear icon** at the top right and select **Send**.
3. Enter a **Title** and choose **BigQuery ML Generator** in the "Where should this data go?" field.
4. Fill in the required details:
   - **Model Selection**
   - **Auto Class Weights**
   - **Model Name**
   - **ID Column**
   - **Target Column**
  
<img src="https://github.com/user-attachments/assets/4ea0e0c4-a966-433a-9434-ec9c47c5efe1" alt="image" width="700"/>


5. Click **Send** to generate the model.

## How to Make Predictions

1. Go back to **Explore** and use **Filters** to select your generated **Model Name**.
2. Filter the conditions for which you want to make predictions.
3. Add the measure from **Predictions** to your query.
4. Click **Run** to obtain the predictions.

## Expected Benefits

Looker simplifies data analysis with its user-friendly UI, lowering the barrier for those who are unfamiliar with complex environment settings or coding. Through this API integration, we aim to make the challenging field of machine learning more accessible to everyone. With numerous customizable areas like adding models, we plan to continue improving this project in the future.
