
#' Apply function on highlighted text in console
#'
#' Generic function to run function (fn) with highlighted text as input
#'
#' @param fn name of the function to call
#'
#' @import rstudioapi
#'
send_cmd <- function(fn, trailer='') {
    highlText <- getActiveDocumentContext()$selection[[1]]$text
    code <- paste0(fn,'(',highlText,')',trailer)

    #call function and return cursor to Console
    #callFun("sendToConsole", code, TRUE, TRUE, TRUE)

    #call function and return cursor to Editor
    callFun("sendToConsole", code, TRUE, TRUE, FALSE)
} #send_cmd


##########################################################################
#' Send str to R console
#'
#' Call str in the R console using the highlighted text as the input
#'
#' @details
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
#'
send_str <- function() {
    send_cmd('str')
} #send_str


##########################################################################
#' Send head to R console
#'
#' Call head in the R console using the highlighted text as the input
#'
#' @details
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
#'
send_head <- function() {
    send_cmd('head')
} #send_head


##########################################################################
#' Send tail to R console
#'
#' Call tail in the R console using the highlighted text as the input
#'
#' @details
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
#'
send_tail <- function() {
    send_cmd('tail')
} #send_tail


##########################################################################
#' Reboot rsession cleanly
#'
#' Ensure that packages are detached correctly by removing objects before doing
#' a rsession restart
#'
#' @export
#'
clean_restart <- function() {
    callFun("sendToConsole", "rm(list=ls()); .rs.restartR()", TRUE, TRUE, FALSE)
} #clean_restart


##########################################################################
#' Print whole tbl_df / data.table
#'
#' Convert tbl_df or data.table to data frame and print data frame in console
#'
#' @export
#'
print_df <- function() {
    send_cmd('as.data.frame')
} #print_df


##########################################################################
#' Print sorted unique list
#'
#' Call sort(unique()) on the highlighted variable
#'
#' @import magrittr
#'
#' @export
#'
sort_uniq <- function() {
    assign('func_sort_unique', function(x) x %>% unique %>% sort,
        envir=globalenv())
    send_cmd('func_sort_unique')
} #sort_uniq


##########################################################################
#' Run function's parameters highlited as R commands
#'
#' Replace the ',' in the function call with ';' so it's understood by R
#'
#' @param str_arg String of the arguments
#'
#' @import rstudioapi
#'
send_fc_arg <- function(str_arg) {
    highlText <- getActiveDocumentContext()$selection[[1]]$text

    ## I need to manage the fact that sometimes the arguments have commas (ex: c(1,2,3))

    ## I split over all ","
    separate_arg <- strsplit(highlText, ",")[[1]]
    ## I find all the string with "=" which are the base arguments
    equal_in_arg <- grepl("=", separate_arg)

    ## I loop over the equal_in_arg vector to evaluate if I have to add a lost ","
    ## The idea is that if the ith element of equal_in_arg is:
    ##  - TRUE followed by TRUE, it's a complete argument to keep as is
    ##  - TRUE followed by one or multiple FALSE, I need to paste this TRUE
    ##    with all following FALSE collapsing with "," to obtain my complete argument
    ## I also have to be carefull with the vector last element
    all_args <- NULL
    for(i in 1:length(equal_in_arg)) {
        if(i==length(equal_in_arg) & equal_in_arg[i]==TRUE) {
            all_args[i] <- separate_arg[i]
        } else {
            if(equal_in_arg[i]==TRUE & equal_in_arg[i+1]==TRUE) {
                all_args[i] <- separate_arg[i]
            }
            if(equal_in_arg[i]==TRUE & equal_in_arg[i+1]==FALSE) {
                how_many_false <- which.max(c(equal_in_arg[(i+1):length(equal_in_arg)],TRUE))-1
                all_args[i] <- paste(separate_arg[i:(i+how_many_false)], collapse = ",")
            }
        }
    }

    all_args <- all_args[!is.na(all_args)] # remove created NA
    code <- paste(all_args, collapse = ";")

    #call function and return cursor to Editor
    callFun("sendToConsole", code, TRUE, TRUE, FALSE)
} #send_cmd
