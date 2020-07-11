

# avoid cryptic warning in exercises:
invisible_feedback <- function() {
  NULL
}
# load dep functions ino enviroment:
# return feedback as html
feedback_as_html <- function(feedback) {
  
  if (is.null(feedback$type) || identical(feedback$type, "auto"))
    feedback$type <- ifelse(feedback$correct, "success", "error")
  
  if (feedback$type == "custom") {
    div(feedback$message)
  }
  else if (feedback$type %in% c("success", "info", "warning", "error")) {
    if (feedback$type == "error")
      feedback$type <- "danger"
    div(class = paste0("alert alert-", feedback$type),
        role = "alert",
        feedback$message
    )
  }
  else {
    stop("Invalid message type specified.", call. = FALSE)
  }
}
# return feedback if it's valid, otherwise throw an error
feedback_validated <- function(feedback) {
  
  if (is.null(feedback))
    return(feedback)
  
  if (!is.character(feedback$message))
    stop("Feedback must include a 'message' character vector", call. = FALSE)
  
  if (!is.logical(feedback$correct))
    stop("Feedback must include a 'correct' logical value", call. = FALSE)
  
  feedback_types <- c("auto", "success", "info", "warning", "error", "custom")
  if (is.null(feedback$type))
    feedback$type <- "auto"
  if (!feedback$type %in% feedback_types)
    stop("Feedback 'type' field must be one of these values: ",
         paste(feedback_types, collapse = ", "), call. = FALSE)
  
  feedback_locations <- c("append", "prepend", "replace")
  if (is.null(feedback$location))
    feedback$location <- "append"
  if (!feedback$location %in% feedback_locations)
    stop("Feedback 'location' field must be one of these values: ",
         paste(feedback_locations, collapse = ", "), call. = FALSE)
  
  feedback
}
assignInNamespace("invisible_feedback",invisible_feedback,ns="learnr")