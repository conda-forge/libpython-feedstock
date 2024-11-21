echo "setting distutils cfg in %PREFIX%"
if not exist %PREFIX%\Lib\distutils\ mkdir %PREFIX%\Lib\distutils\
if errorlevel 1 exit 1
dir %PREFIX%\Lib\distutils\
echo [build_ext]           > %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1
echo define=MS_WIN64      >> %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1
echo compiler=mingw32     >> %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1

echo "setting setuptools cfg"
dir %PREFIX%\Lib\site-packages\setuptools\_distutils\
copy %PREFIX%\Lib\distutils\distutils.cfg %PREFIX%\Lib\site-packages\setuptools\_distutils\
