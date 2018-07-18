#1 create a new environment in the AppDir with packages specified with a text-file
conda create -p $TRAVIS_BUILD_DIR/conda/AppDir/usr --file freecad-spec-file.txt --copy

#2 delete unnecessary stuff
rm -rf $TRAVIS_BUILD_DIR/conda/AppDir/usr/include
find $TRAVIS_BUILD_DIR/conda/AppDir/usr -name \*.a -delete
mv $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin_tmp
mkdir $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin
cp $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin_tmp/FreeCAD $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin/FreeCAD
cp $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin_tmp/activate $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin/  
cp $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin_tmp/python $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin/
cp $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin_tmp/widget.py $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin/
rm -rf $TRAVIS_BUILD_DIR/conda/AppDir/usr/bin_tmp
#+ deleting some specific libraries not needed. eg.: stdc++

#3 create the appimage
ARCH=x86_64 $TRAVIS_BUILD_DIR/appimagetool-x86_64.AppImage $TRAVIS_BUILD_DIR/conda/AppDir

#4 setting rights for the appimage
chmod +x *.AppImage

#5 delete the created environment
rm -rf $TRAVIS_BUILD_DIR/conda/AppDir/usr

exit(0)
