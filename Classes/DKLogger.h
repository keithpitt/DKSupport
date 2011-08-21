//
//  DKLogger.h
//  DKSupport
//
//  Created by Keith Pitt on 21/08/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#ifndef DKSupport_DKLogger_h
#define DKSupport_DKLogger_h

#ifdef DEBUG

    #define DKLog(level, ...)    LogMessageF(__FILE__,__LINE__,__FUNCTION__,@"[DK]",level,__VA_ARGS__)

#else

    #define DKLog(...)    do{}while(0)

#endif

#endif
