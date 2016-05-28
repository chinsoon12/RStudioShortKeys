send_str <- function() {
	sendToConsole(paste0('str(',getActiveDocumentContext()$text,')'))
}

send_head <- function() {
	sendToConsole(paste0('head(',getActiveDocumentContext()$text,')'))
}

send_tail <- function() {
	sendToConsole(paste0('tail(',getActiveDocumentContext()$text,')'))
}