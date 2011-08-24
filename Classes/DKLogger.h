//
//  DKLogger.h
//  DKSupport
//
//  Created by Keith Pitt on 21/08/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "LoggerClient.h"

#ifdef DEBUG

    #define DKLog(level, ...)    LogMessageF(__FILE__,__LINE__,__FUNCTION__,@"DiscoKit",level,__VA_ARGS__)

#else

    #define DKLog(...)    do{}while(0)

#endif