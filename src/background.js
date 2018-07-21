chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
    if (request.type === 'tabsCreate') {
        chrome.tabs.create({ url: request.options.url, active: request.options.active }, function () {
        });
    }
});
