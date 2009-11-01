# Makefile for "Search on green"
SDK = /opt/android-sdk-linux_x86-1.6_r1
SearchOnGreen.apk: name/boyle/chris/searchongreen/SearchOnGreen.java AndroidManifest.xml res/drawable/icon.png
	rm -f $@
	mkdir -p tmp
	mkdir -p bin
	$(SDK)/platforms/android-1.6/tools/aapt package -f -M AndroidManifest.xml -S res -I $(SDK)/platforms/android-1.6/android.jar -F tmp/resources.apk
	$(SDK)/platforms/android-1.6/tools/aapt package -m -M AndroidManifest.xml -S res -I $(SDK)/platforms/android-1.6/android.jar -J .
	javac -source 1.5 -target 1.5 -cp $(SDK)/platforms/android-1.5/android.jar -d bin $<
	$(SDK)/platforms/android-1.6/tools/dx --dex --verbose --output=tmp/classes.dex bin
	$(SDK)/tools/apkbuilder tmp/unsigned.apk -u -f tmp/classes.dex -z tmp/resources.apk
	@stty -echo || true
	jarsigner -signedjar tmp/unaligned.apk tmp/unsigned.apk cmb
	@stty echo && echo "" || true
	$(SDK)/tools/zipalign 4 tmp/unaligned.apk $@
	rm -rf bin tmp name/boyle/chris/searchongreen/R.java
	@echo "*** Done: $@"
clean:
	rm -rf bin tmp SearchOnGreen.apk name/boyle/chris/searchongreen/R.java
