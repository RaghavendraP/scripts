#taken from SO question: https://android.stackexchange.com/questions/56635/how-can-i-export-the-list-of-open-chrome-tabs
#chrome build 73.0.3683.103
#Connect the android mobile to computer through USB debugging mode and open the dev tools. https://developers.google.com/web/tools/chrome-devtools/remote-debugging/
#wait for the device status to update to connected
#open the chrome and all the tabs would be shown in remotedevices against the mobile device
#execute the following commands to get the tabs to clipboard
#Method1:Copy to Str
tabs = document.querySelector('div /deep/ div /deep/ div /deep/ div /deep/ div /deep/ div /deep/ div.vbox.flex-auto').shadowRoot.querySelectorAll('.devices-view .device-page-list .vbox')
str = '';
for (i=0;i<tabs.length;i++){
  if (tabs[i].querySelector('.device-page-url .devtools-link') != null){
    str += '- ['+tabs[i].querySelector('.device-page-title').textContent + '](' + tabs[i].querySelector('.device-page-url .devtools-link').getAttribute('href') +')\n'
  } else {
    console.log(tabs[i])
  }
}
copy(str)

#output looks like:
#- [How can I export the list of open Chrome tabs? - Android Enthusiasts Stack Exchange](https://android.stackexchange.com/questions/56635/how-can-i-export-the-list-of-open-chrome-tabs)
#- [Get Started with Remote Debugging Android Devices  |  Tools for Web Developers  |  Google Developers](https://developers.google.com/web/tools/chrome-devtools/remote-debugging/)
#- [How To Enable USB Debugging On Your Android Phone](https://www.groovypost.com/howto/mobile/how-to-enable-usb-debugging-android-phone/)

#Method2: Create a js dict with format [title,url]
tabs = Array.from(document.querySelector('div /deep/ div /deep/ div /deep/ div /deep/ div /deep/ div /deep/ div.vbox.flex-auto').shadowRoot.querySelectorAll('.devices-view .device-page-list .vbox'), s => ({title: s.querySelector('.device-page-title').textContent, url: s.querySelector('.device-page-url .devtools-link').getAttribute('href')}))
copy(tabs) #now the output of tabs would be copied in json array format. You can copy them into https://konklone.io/json/ to convert into csv.
#or
str = '';
for (i=0;i<tabs.length;i++){
  str += tabs[i].title + '\n'+ tabs[i].url + '\n\n'
}
copy(str)
