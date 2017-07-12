//
//  Constants.h
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/25/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/// This Enum is a Http Methods/Verbs enum. The developer can use it when passing httpMethod type.
typedef enum {
    POST,
    GET,
    PUT,
    DELETE
} Method;
/// Defining Completion block used inside requests completion.
typedef void(^myCompletion)(NSDictionary * response, NSError * error);
#endif /* Constants_h */
