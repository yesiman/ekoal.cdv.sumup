# cordova-plugin-sumup
Cordova plugin for native acces to the sumup paiement system

This plugin permit interconnection beetween native sumUp SDK and hybrid mobile app.

<b>Compatibility :</b>
- IOS
- ANDROID

<b>Installation</b>

$ cordova plugin add https://github.com/yesiman/ekoal.cdv.sumup

Acually have to update your source script to update your AFFILIATION KEY, next release will permit to pass this affiliation key via cordova plugin installion for auto injection

<b>IOS</b>

<b>ANDROID Installation</b>

Update yout gradle Android module file 
//Add repositorie local location
buildscript {
    repositories {
        flatDir {
            dirs 'libs'
        }
    }
}

//Avoid duplicate jar files during compilation
android
{
  packagingOptions {
        exclude 'META-INF/DEPENDENCIES'
        exclude 'META-INF/NOTICE'
        exclude 'META-INF/LICENSE'
        exclude 'META-INF/LICENSE.txt'
        exclude 'META-INF/NOTICE.txt'
        exclude 'META-INF/services/javax.annotation.processing.Processor'
    }
}

//Module definition
dependencies {
    compile('com.sumup:merchant-sdk:1.55.1@aar') {
        transitive = true
    }
}
