%hook NSURLConnection

// Hook for synchronous requests
+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error {
    NSURL *originalURL = request.URL;
    NSString *originalHost = @"apple-mobile.query.yahooapis.com";
    NSString *redirectHost = @"notdbrand.com:8000";

    if ([originalURL.host isEqualToString:originalHost]) {
        NSString *urlString = [originalURL.absoluteString stringByReplacingOccurrencesOfString:originalHost withString:redirectHost];
        NSURL *redirectURL = [NSURL URLWithString:urlString];
        
        NSMutableURLRequest *newRequest = [request mutableCopy];
        newRequest.URL = redirectURL;
        
        return %orig(newRequest, response, error);
    }

    return %orig(request, response, error);
}

// Hook for asynchronous requests
- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate {
    NSURL *originalURL = request.URL;
    NSString *originalHost = @"apple-mobile.query.yahooapis.com";
    NSString *redirectHost = @"notdbrand.com:8000";

    if ([originalURL.host isEqualToString:originalHost]) {
        NSString *urlString = [originalURL.absoluteString stringByReplacingOccurrencesOfString:originalHost withString:redirectHost];
        NSURL *redirectURL = [NSURL URLWithString:urlString];
        
        NSMutableURLRequest *newRequest = [request mutableCopy];
        newRequest.URL = redirectURL;

        return %orig(newRequest, delegate);
    }

    return %orig(request, delegate);
}

%end

