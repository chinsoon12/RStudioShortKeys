
#' Apply function on highlighted text in console
#'
#' Generic function to run function (fn) with highlighted text as input
#'
#' @param fn name of the function to call
#'
#' @import rstudioapi
send_cmd <- function(fn) {
    highlText <- getActiveDocumentContext()$selection[[1]]$text
    sendToConsole(paste0(fn,'(',highlText,')'))
} #send_cmd


##########################################################################
#' Send str to R console
#'
#' Call str in the R console using the highlighted text as the input
#'
#' @usage
#' 1) Highlight variable or code by double clicking or selecting
#' 2) Click the Addins menu
#' 3) Select 'Call str'
#'
#' Alternatively, you can use shortcut keys
#'
#' @note
#' Function depends on 1) RStudio (>= 0.99.878) with support for addins,
#' and 2) getActiveDocumentContext & sendToConsole from
#' rstudioapi package (>= 0.5-1)
#'
#' @export
send_str <- function() {
    send_cmd('str')
} #send_str


##########################################################################
#' Send head to R console
#'
#' Call head in the R console using the highlighted text as the input
#'
#' @usage
#' 1) Highlight variable or code by double clicking or selecting
#' 2) Click the Addins menu
#' 3) Select 'Call head'
#'
#' Alternatively, you can use shortcut keys
#'
#' @note
#' Function depends on 1) RStudio (>= 0.99.878) with support for addins,
#' and 2) getActiveDocumentContext & sendToConsole from
#' rstudioapi package (>= 0.5-1)
#'
#' @export
send_head <- function() {
    send_cmd('head')
} #send_head


##########################################################################
#' Send tail to R console
#'
#' Call tail in the R console using the highlighted text as the input
#'
#' @usage
#' 1) Highlight variable or code by double clicking or selecting
#' 2) Click the Addins menu
#' 3) Select 'Call tail'
#'
#' Alternatively, you can use shortcut keys
#'
#' @note
#' Function depends on 1) RStudio (>= 0.99.878) with support for addins,
#' and 2) getActiveDocumentContext & sendToConsole from
#' rstudioapi package (>= 0.5-1)
#'
#' @export
send_tail <- function() {
    send_cmd('tail')
} #send_tail
