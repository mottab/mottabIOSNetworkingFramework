//
//  Constants.h
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/25/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

typedef enum {
    POST,
    GET,
    PUT,
    DELETE
} Method;

typedef void(^myCompletion)(NSDictionary* response);

#endif /* Constants_h */
