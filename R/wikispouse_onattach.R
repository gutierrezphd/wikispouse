### WIKISPOUSE FUNCTON ####

.onAttach <- function(libname, pkgname) {
  message <- c("\n Thank you for using the {wikispouse} R package!",
               "\n \n Have fun looking up spouses of famous people, if that's your thing",
               "\n \n You can contact me at ian.gutierrez.phd@gmail.com or @ianagutierrez",
               "\n \n Happy searching!")
  packageStartupMessage(message)
}
