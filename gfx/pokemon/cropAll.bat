FOR /R %%a IN (front.png) DO magick "%%~a" -crop 56x56+8+8 "%%~a"

FOR /R %%a IN (back.png) DO magick "%%~a" -crop 48x48+8+12 "%%~a"