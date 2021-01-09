### WIKISPOUSE FUNCTON ####

.onAttach <- function(libname, pkgname) {
  message <- c("\n Thank you for using the {wikispouse} R package!",
               "\n \n Have fun looking up spouses of famous people, if that's your thing.",
               "\n Just call wikispouse() and type a famous person's name.",
               "\n \n ...that's it.",
               "\n \n You can contact me at ian.gutierrez.phd@gmail.com or @ianagutierrez.",
               "\n \n Happy searching! \n \n")
  packageStartupMessage(message)
}
