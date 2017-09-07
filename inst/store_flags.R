library(grConvert)
library(grImport2)

lf <- list.files(path = "svg", pattern = glob2rx("*.svg"), full.names = FALSE)

for (srcfile in lf)
{
  print(srcfile)
  convertPicture(paste0("svg/", srcfile), paste0("cairo/", srcfile))
}

lf <- list.files(path = "cairo", pattern = glob2rx("*.svg"), full.names = TRUE)

.flaglist <- lapply(lf, readPicture)
names(.flaglist) <- tolower(gsub("^cairo/|\\.svg", "", lf))

save(.flaglist, file="lflags.rda")
