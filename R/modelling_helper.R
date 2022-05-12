#' Partition data
#'
#' This function divide data into training and holdout set and returns them as a list.
#' It uses caret package createDataPartition() function to make the division.
#'
#' @param input_data data.frame with all the data
#' @param target_col name or column number of a target variable
#' @param train_ratio what should be the ratio
#' @param split_y should the target variable be returned separately?
#'
#' @return
#' @importFrom dplyr select
#' @importFrom caret createDataPartition
#' @importFrom tibble as_tibble
#' @export
#'
#' @examples
#' \dontrun{
#' .
#' }
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


#' Test ROC
#'
#' This function is taken from https://topepo.github.io/caret/subsampling-for-class-imbalances.html#subsampling-techniques and adjusted for this tutorial.
#' It computes ROC on the test set.
#'
#' @param model This should be a caret model
#' @param data These are new data for prediction
#' @param y a vector with the refence data
#'
#' @return
#' @importFrom pROC roc ci
#' @export
#' @examples
#' \dontrun{
#' .
#' }
test_roc <- function(model, data, y) {
  roc_obj <- pROC::roc(y |> as.numeric() -1,
                       predict(model, data) |> as.numeric() -1,
                       levels = c(0, 1))
  pROC::ci(roc_obj)
}
