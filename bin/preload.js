page = this;
page.onResourceRequested = function(requestData, request) {
    // if ((/http[s]?:\/\/.+?\.css.*?/gi).test(requestData['url']) || requestData.headers['Content-Type'] == 'text/css') {
    //     console.log('The url of the request is matching. Aborting: ' + requestData['url']);
    //     request.abort();
    // }

    if ((/.*?google.*?/gi).test(requestData['url'])) {
        console.log('The url of the request is matching. Aborting: ' + requestData['url']);
        request.abort();
    }

    if (requestData['url'] == 'http://user.qbao.com/usercenter/ucIndex.html') {
        console.log('The url of the request is matching. Aborting: ' + requestData['url']);
        request.abort();

        setTimeout(function() {
            page.open('data:text/html,<html><body id="__success__"></body></html>', function(){});
        }, 100);
    }
};
