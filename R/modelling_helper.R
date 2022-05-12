get_data_partition <- function(input_data,
                               target_col,
                               train_ratio,
                               split_y = FALSE){

  input_data <- tibble::as_tibble(input_data)
  if (is.character(target_col)) {
    input_y <- input_data |>
      dplyr::select(target_col)
    ind_test <- names(input_data) == target_col
  } else if (is.numeric(target_col) | is.integer(target_col)) {
    input_y <- input_data[, target_col]
    ind_test <- seq.int(ncol(input_data)) == target_col
  } else {
    stop("y should be target variable name (string) or column index (numeric).")
  }
  input_y <- input_data[[target_col]]
  ind <- caret::createDataPartition(input_y |> unlist(),
                                    p = train_ratio,
                                    list = FALSE)
  out <- list()
  if (split_y) {
    out$train_x <- input_data[ind, !ind_test]
    out$train_y <- input_data[ind, ind_test] |> unlist()
    out$test_x <- input_data[-ind, !ind_test]
    out$test_y <- input_data[-ind, ind_test] |> unlist()
  } else {
    out$train <- input_data[ind,]
    out$test <- input_data[-ind,]
  }
  return(out)
}


test_roc <- function(model, data, y) {
  roc_obj <- pROC::roc(y |> as.numeric() -1,
                       predict(model, data) |> as.numeric() -1,
                       levels = c(0, 1))
  pROC::ci(roc_obj)
}
