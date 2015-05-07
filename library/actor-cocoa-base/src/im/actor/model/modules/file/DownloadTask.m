//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/file/DownloadTask.java
//


#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/FileSystemProvider.h"
#include "im/actor/model/HttpDownloaderProvider.h"
#include "im/actor/model/api/FileLocation.h"
#include "im/actor/model/api/rpc/RequestGetFileUrl.h"
#include "im/actor/model/api/rpc/ResponseGetFileUrl.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/entity/FileReference.h"
#include "im/actor/model/files/FileSystemReference.h"
#include "im/actor/model/files/OutputFile.h"
#include "im/actor/model/http/FileDownloadCallback.h"
#include "im/actor/model/log/Log.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/file/DownloadManager.h"
#include "im/actor/model/modules/file/DownloadTask.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "im/actor/model/network/RpcCallback.h"
#include "im/actor/model/network/RpcException.h"
#include "java/lang/Runnable.h"

#define ImActorModelModulesFileDownloadTask_SIM_BLOCKS_COUNT 4

@interface ImActorModelModulesFileDownloadTask () {
 @public
  NSString *TAG_;
  jboolean LOG_;
  AMFileReference *fileReference_;
  DKActorRef *manager_;
  id<AMFileSystemProvider> fileSystemProvider_;
  id<AMHttpDownloaderProvider> downloaderProvider_;
  id<AMFileSystemReference> destReference_;
  id<AMOutputFile> outputFile_;
  jboolean isCompleted_;
  NSString *fileUrl_;
  jint blockSize_;
  jint blocksCount_;
  jint nextBlock_;
  jint currentDownloads_;
  jint downloaded_;
}

- (void)requestUrl;

- (void)startDownload;

- (void)completeDownload;

- (void)checkQueue;

- (void)downloadPartWithInt:(jint)blockIndex
                    withInt:(jint)fileOffset;

- (void)reportError;

- (void)reportProgressWithFloat:(jfloat)progress;

- (void)reportCompleteWithAMFileSystemReference:(id<AMFileSystemReference>)reference;

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask, TAG_, NSString *)
J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask, fileReference_, AMFileReference *)
J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask, manager_, DKActorRef *)
J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask, fileSystemProvider_, id<AMFileSystemProvider>)
J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask, downloaderProvider_, id<AMHttpDownloaderProvider>)
J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask, destReference_, id<AMFileSystemReference>)
J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask, outputFile_, id<AMOutputFile>)
J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask, fileUrl_, NSString *)

J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesFileDownloadTask, SIM_BLOCKS_COUNT, jint)

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_requestUrl(ImActorModelModulesFileDownloadTask *self);

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_startDownload(ImActorModelModulesFileDownloadTask *self);

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_completeDownload(ImActorModelModulesFileDownloadTask *self);

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_checkQueue(ImActorModelModulesFileDownloadTask *self);

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_downloadPartWithInt_withInt_(ImActorModelModulesFileDownloadTask *self, jint blockIndex, jint fileOffset);

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_reportError(ImActorModelModulesFileDownloadTask *self);

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_reportProgressWithFloat_(ImActorModelModulesFileDownloadTask *self, jfloat progress);

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_reportCompleteWithAMFileSystemReference_(ImActorModelModulesFileDownloadTask *self, id<AMFileSystemReference> reference);

@interface ImActorModelModulesFileDownloadTask_$1 : NSObject < AMRpcCallback > {
 @public
  ImActorModelModulesFileDownloadTask *this$0_;
}

- (void)onResultWithImActorModelNetworkParserResponse:(ImActorModelApiRpcResponseGetFileUrl *)response;

- (void)onErrorWithAMRpcException:(AMRpcException *)e;

- (instancetype)initWithImActorModelModulesFileDownloadTask:(ImActorModelModulesFileDownloadTask *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesFileDownloadTask_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask_$1, this$0_, ImActorModelModulesFileDownloadTask *)

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_$1_initWithImActorModelModulesFileDownloadTask_(ImActorModelModulesFileDownloadTask_$1 *self, ImActorModelModulesFileDownloadTask *outer$);

__attribute__((unused)) static ImActorModelModulesFileDownloadTask_$1 *new_ImActorModelModulesFileDownloadTask_$1_initWithImActorModelModulesFileDownloadTask_(ImActorModelModulesFileDownloadTask *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesFileDownloadTask_$1)

@interface ImActorModelModulesFileDownloadTask_$2 : NSObject < ImActorModelHttpFileDownloadCallback > {
 @public
  ImActorModelModulesFileDownloadTask *this$0_;
  jint val$blockIndex_;
  jint val$fileOffset_;
}

- (void)onDownloadedWithByteArray:(IOSByteArray *)data;

- (void)onDownloadFailure;

- (instancetype)initWithImActorModelModulesFileDownloadTask:(ImActorModelModulesFileDownloadTask *)outer$
                                                    withInt:(jint)capture$0
                                                    withInt:(jint)capture$1;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesFileDownloadTask_$2)

J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask_$2, this$0_, ImActorModelModulesFileDownloadTask *)

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_$2_initWithImActorModelModulesFileDownloadTask_withInt_withInt_(ImActorModelModulesFileDownloadTask_$2 *self, ImActorModelModulesFileDownloadTask *outer$, jint capture$0, jint capture$1);

__attribute__((unused)) static ImActorModelModulesFileDownloadTask_$2 *new_ImActorModelModulesFileDownloadTask_$2_initWithImActorModelModulesFileDownloadTask_withInt_withInt_(ImActorModelModulesFileDownloadTask *outer$, jint capture$0, jint capture$1) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesFileDownloadTask_$2)

@interface ImActorModelModulesFileDownloadTask_$2_$1 : NSObject < JavaLangRunnable > {
 @public
  ImActorModelModulesFileDownloadTask_$2 *this$0_;
  IOSByteArray *val$data_;
}

- (void)run;

- (instancetype)initWithImActorModelModulesFileDownloadTask_$2:(ImActorModelModulesFileDownloadTask_$2 *)outer$
                                                 withByteArray:(IOSByteArray *)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesFileDownloadTask_$2_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask_$2_$1, this$0_, ImActorModelModulesFileDownloadTask_$2 *)
J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask_$2_$1, val$data_, IOSByteArray *)

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_$2_$1_initWithImActorModelModulesFileDownloadTask_$2_withByteArray_(ImActorModelModulesFileDownloadTask_$2_$1 *self, ImActorModelModulesFileDownloadTask_$2 *outer$, IOSByteArray *capture$0);

__attribute__((unused)) static ImActorModelModulesFileDownloadTask_$2_$1 *new_ImActorModelModulesFileDownloadTask_$2_$1_initWithImActorModelModulesFileDownloadTask_$2_withByteArray_(ImActorModelModulesFileDownloadTask_$2 *outer$, IOSByteArray *capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesFileDownloadTask_$2_$1)

@interface ImActorModelModulesFileDownloadTask_$2_$2 : NSObject < JavaLangRunnable > {
 @public
  ImActorModelModulesFileDownloadTask_$2 *this$0_;
}

- (void)run;

- (instancetype)initWithImActorModelModulesFileDownloadTask_$2:(ImActorModelModulesFileDownloadTask_$2 *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesFileDownloadTask_$2_$2)

J2OBJC_FIELD_SETTER(ImActorModelModulesFileDownloadTask_$2_$2, this$0_, ImActorModelModulesFileDownloadTask_$2 *)

__attribute__((unused)) static void ImActorModelModulesFileDownloadTask_$2_$2_initWithImActorModelModulesFileDownloadTask_$2_(ImActorModelModulesFileDownloadTask_$2_$2 *self, ImActorModelModulesFileDownloadTask_$2 *outer$);

__attribute__((unused)) static ImActorModelModulesFileDownloadTask_$2_$2 *new_ImActorModelModulesFileDownloadTask_$2_$2_initWithImActorModelModulesFileDownloadTask_$2_(ImActorModelModulesFileDownloadTask_$2 *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesFileDownloadTask_$2_$2)

@implementation ImActorModelModulesFileDownloadTask

- (instancetype)initWithAMFileReference:(AMFileReference *)fileReference
                         withDKActorRef:(DKActorRef *)manager
         withImActorModelModulesModules:(ImActorModelModulesModules *)messenger {
  ImActorModelModulesFileDownloadTask_initWithAMFileReference_withDKActorRef_withImActorModelModulesModules_(self, fileReference, manager, messenger);
  return self;
}

- (void)preStart {
  if (LOG_) {
    AMLog_dWithNSString_withNSString_(TAG_, @"Creating file...");
  }
  fileSystemProvider_ = [((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getConfiguration])) getFileSystemProvider];
  if (fileSystemProvider_ == nil) {
    ImActorModelModulesFileDownloadTask_reportError(self);
    if (LOG_) {
      AMLog_dWithNSString_withNSString_(TAG_, @"No FileSystem available");
    }
    return;
  }
  downloaderProvider_ = [((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getConfiguration])) getHttpDownloaderProvider];
  if (downloaderProvider_ == nil) {
    ImActorModelModulesFileDownloadTask_reportError(self);
    if (LOG_) {
      AMLog_dWithNSString_withNSString_(TAG_, @"No HTTP Support available");
    }
    return;
  }
  destReference_ = [((id<AMFileSystemProvider>) nil_chk(fileSystemProvider_)) createTempFile];
  if (destReference_ == nil) {
    ImActorModelModulesFileDownloadTask_reportError(self);
    if (LOG_) {
      AMLog_dWithNSString_withNSString_(TAG_, @"Unable to create reference");
    }
    return;
  }
  outputFile_ = [((id<AMFileSystemReference>) nil_chk(destReference_)) openWriteWithSize:[((AMFileReference *) nil_chk(fileReference_)) getFileSize]];
  if (outputFile_ == nil) {
    ImActorModelModulesFileDownloadTask_reportError(self);
    if (LOG_) {
      AMLog_dWithNSString_withNSString_(TAG_, @"Unable to write wile");
    }
    return;
  }
  ImActorModelModulesFileDownloadTask_requestUrl(self);
}

- (void)requestUrl {
  ImActorModelModulesFileDownloadTask_requestUrl(self);
}

- (void)startDownload {
  ImActorModelModulesFileDownloadTask_startDownload(self);
}

- (void)completeDownload {
  ImActorModelModulesFileDownloadTask_completeDownload(self);
}

- (void)checkQueue {
  ImActorModelModulesFileDownloadTask_checkQueue(self);
}

- (void)downloadPartWithInt:(jint)blockIndex
                    withInt:(jint)fileOffset {
  ImActorModelModulesFileDownloadTask_downloadPartWithInt_withInt_(self, blockIndex, fileOffset);
}

- (void)reportError {
  ImActorModelModulesFileDownloadTask_reportError(self);
}

- (void)reportProgressWithFloat:(jfloat)progress {
  ImActorModelModulesFileDownloadTask_reportProgressWithFloat_(self, progress);
}

- (void)reportCompleteWithAMFileSystemReference:(id<AMFileSystemReference>)reference {
  ImActorModelModulesFileDownloadTask_reportCompleteWithAMFileSystemReference_(self, reference);
}

@end

void ImActorModelModulesFileDownloadTask_initWithAMFileReference_withDKActorRef_withImActorModelModulesModules_(ImActorModelModulesFileDownloadTask *self, AMFileReference *fileReference, DKActorRef *manager, ImActorModelModulesModules *messenger) {
  (void) ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(self, messenger);
  self->blockSize_ = 32 * 1024;
  self->nextBlock_ = 0;
  self->currentDownloads_ = 0;
  self->downloaded_ = 0;
  self->TAG_ = JreStrcat("$JC", @"DownloadTask{", [((AMFileReference *) nil_chk(fileReference)) getFileId], '}');
  self->LOG_ = [((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk(messenger)) getConfiguration])) isEnableFilesLogging];
  self->fileReference_ = fileReference;
  self->manager_ = manager;
}

ImActorModelModulesFileDownloadTask *new_ImActorModelModulesFileDownloadTask_initWithAMFileReference_withDKActorRef_withImActorModelModulesModules_(AMFileReference *fileReference, DKActorRef *manager, ImActorModelModulesModules *messenger) {
  ImActorModelModulesFileDownloadTask *self = [ImActorModelModulesFileDownloadTask alloc];
  ImActorModelModulesFileDownloadTask_initWithAMFileReference_withDKActorRef_withImActorModelModulesModules_(self, fileReference, manager, messenger);
  return self;
}

void ImActorModelModulesFileDownloadTask_requestUrl(ImActorModelModulesFileDownloadTask *self) {
  if (self->LOG_) {
    AMLog_dWithNSString_withNSString_(self->TAG_, @"Loading url...");
  }
  [self requestWithImActorModelNetworkParserRequest:new_ImActorModelApiRpcRequestGetFileUrl_initWithImActorModelApiFileLocation_(new_ImActorModelApiFileLocation_initWithLong_withLong_([((AMFileReference *) nil_chk(self->fileReference_)) getFileId], [self->fileReference_ getAccessHash])) withAMRpcCallback:new_ImActorModelModulesFileDownloadTask_$1_initWithImActorModelModulesFileDownloadTask_(self)];
}

void ImActorModelModulesFileDownloadTask_startDownload(ImActorModelModulesFileDownloadTask *self) {
  self->blocksCount_ = [((AMFileReference *) nil_chk(self->fileReference_)) getFileSize] / self->blockSize_;
  if ([self->fileReference_ getFileSize] % self->blockSize_ != 0) {
    self->blocksCount_++;
  }
  if (self->LOG_) {
    AMLog_dWithNSString_withNSString_(self->TAG_, JreStrcat("$I$", @"Starting downloading ", self->blocksCount_, @" blocks"));
  }
  ImActorModelModulesFileDownloadTask_checkQueue(self);
}

void ImActorModelModulesFileDownloadTask_completeDownload(ImActorModelModulesFileDownloadTask *self) {
  if (self->isCompleted_) {
    return;
  }
  if (self->LOG_) {
    AMLog_dWithNSString_withNSString_(self->TAG_, @"Closing file...");
  }
  if (![((id<AMOutputFile>) nil_chk(self->outputFile_)) close]) {
    ImActorModelModulesFileDownloadTask_reportError(self);
    return;
  }
  id<AMFileSystemReference> reference = [((id<AMFileSystemProvider>) nil_chk(self->fileSystemProvider_)) commitTempFile:self->destReference_ withReference:self->fileReference_];
  if (reference == nil) {
    ImActorModelModulesFileDownloadTask_reportError(self);
    return;
  }
  if (self->LOG_) {
    AMLog_dWithNSString_withNSString_(self->TAG_, JreStrcat("$$C", @"Complete download {", [((id<AMFileSystemReference>) nil_chk(reference)) getDescriptor], '}'));
  }
  ImActorModelModulesFileDownloadTask_reportCompleteWithAMFileSystemReference_(self, reference);
}

void ImActorModelModulesFileDownloadTask_checkQueue(ImActorModelModulesFileDownloadTask *self) {
  if (self->isCompleted_) {
    return;
  }
  if (self->LOG_) {
    AMLog_dWithNSString_withNSString_(self->TAG_, JreStrcat("$ICI", @"checkQueue ", self->currentDownloads_, '/', self->nextBlock_));
  }
  if (self->currentDownloads_ == 0 && self->nextBlock_ >= self->blocksCount_) {
    ImActorModelModulesFileDownloadTask_completeDownload(self);
  }
  else if (self->currentDownloads_ < ImActorModelModulesFileDownloadTask_SIM_BLOCKS_COUNT && self->nextBlock_ < self->blocksCount_) {
    self->currentDownloads_++;
    jint blockIndex = self->nextBlock_++;
    jint offset = blockIndex * self->blockSize_;
    if (self->LOG_) {
      AMLog_dWithNSString_withNSString_(self->TAG_, JreStrcat("$I$", @"Starting part #", blockIndex, @" download"));
    }
    ImActorModelModulesFileDownloadTask_downloadPartWithInt_withInt_(self, blockIndex, offset);
    ImActorModelModulesFileDownloadTask_checkQueue(self);
  }
  else {
    if (self->LOG_) {
      AMLog_dWithNSString_withNSString_(self->TAG_, @"Task queue is full");
    }
  }
}

void ImActorModelModulesFileDownloadTask_downloadPartWithInt_withInt_(ImActorModelModulesFileDownloadTask *self, jint blockIndex, jint fileOffset) {
  [((id<AMHttpDownloaderProvider>) nil_chk(self->downloaderProvider_)) downloadPartWithNSString:self->fileUrl_ withInt:fileOffset withInt:self->blockSize_ withInt:[((AMFileReference *) nil_chk(self->fileReference_)) getFileSize] withImActorModelHttpFileDownloadCallback:new_ImActorModelModulesFileDownloadTask_$2_initWithImActorModelModulesFileDownloadTask_withInt_withInt_(self, blockIndex, fileOffset)];
}

void ImActorModelModulesFileDownloadTask_reportError(ImActorModelModulesFileDownloadTask *self) {
  if (self->isCompleted_) {
    return;
  }
  self->isCompleted_ = YES;
  [((DKActorRef *) nil_chk(self->manager_)) sendWithId:new_ImActorModelModulesFileDownloadManager_OnDownloadedError_initWithLong_([((AMFileReference *) nil_chk(self->fileReference_)) getFileId])];
}

void ImActorModelModulesFileDownloadTask_reportProgressWithFloat_(ImActorModelModulesFileDownloadTask *self, jfloat progress) {
  if (self->isCompleted_) {
    return;
  }
  [((DKActorRef *) nil_chk(self->manager_)) sendWithId:new_ImActorModelModulesFileDownloadManager_OnDownloadProgress_initWithLong_withFloat_([((AMFileReference *) nil_chk(self->fileReference_)) getFileId], progress)];
}

void ImActorModelModulesFileDownloadTask_reportCompleteWithAMFileSystemReference_(ImActorModelModulesFileDownloadTask *self, id<AMFileSystemReference> reference) {
  if (self->isCompleted_) {
    return;
  }
  self->isCompleted_ = YES;
  [((DKActorRef *) nil_chk(self->manager_)) sendWithId:new_ImActorModelModulesFileDownloadManager_OnDownloaded_initWithLong_withAMFileSystemReference_([((AMFileReference *) nil_chk(self->fileReference_)) getFileId], reference)];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesFileDownloadTask)

@implementation ImActorModelModulesFileDownloadTask_$1

- (void)onResultWithImActorModelNetworkParserResponse:(ImActorModelApiRpcResponseGetFileUrl *)response {
  this$0_->fileUrl_ = [((ImActorModelApiRpcResponseGetFileUrl *) nil_chk(response)) getUrl];
  if (this$0_->LOG_) {
    AMLog_dWithNSString_withNSString_(this$0_->TAG_, JreStrcat("$$", @"Loaded file url: ", this$0_->fileUrl_));
  }
  ImActorModelModulesFileDownloadTask_startDownload(this$0_);
}

- (void)onErrorWithAMRpcException:(AMRpcException *)e {
  if (this$0_->LOG_) {
    AMLog_dWithNSString_withNSString_(this$0_->TAG_, @"Unable to load file url");
  }
  ImActorModelModulesFileDownloadTask_reportError(this$0_);
}

- (instancetype)initWithImActorModelModulesFileDownloadTask:(ImActorModelModulesFileDownloadTask *)outer$ {
  ImActorModelModulesFileDownloadTask_$1_initWithImActorModelModulesFileDownloadTask_(self, outer$);
  return self;
}

@end

void ImActorModelModulesFileDownloadTask_$1_initWithImActorModelModulesFileDownloadTask_(ImActorModelModulesFileDownloadTask_$1 *self, ImActorModelModulesFileDownloadTask *outer$) {
  self->this$0_ = outer$;
  (void) NSObject_init(self);
}

ImActorModelModulesFileDownloadTask_$1 *new_ImActorModelModulesFileDownloadTask_$1_initWithImActorModelModulesFileDownloadTask_(ImActorModelModulesFileDownloadTask *outer$) {
  ImActorModelModulesFileDownloadTask_$1 *self = [ImActorModelModulesFileDownloadTask_$1 alloc];
  ImActorModelModulesFileDownloadTask_$1_initWithImActorModelModulesFileDownloadTask_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesFileDownloadTask_$1)

@implementation ImActorModelModulesFileDownloadTask_$2

- (void)onDownloadedWithByteArray:(IOSByteArray *)data {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_ImActorModelModulesFileDownloadTask_$2_$1_initWithImActorModelModulesFileDownloadTask_$2_withByteArray_(self, data)];
}

- (void)onDownloadFailure {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_ImActorModelModulesFileDownloadTask_$2_$2_initWithImActorModelModulesFileDownloadTask_$2_(self)];
}

- (instancetype)initWithImActorModelModulesFileDownloadTask:(ImActorModelModulesFileDownloadTask *)outer$
                                                    withInt:(jint)capture$0
                                                    withInt:(jint)capture$1 {
  ImActorModelModulesFileDownloadTask_$2_initWithImActorModelModulesFileDownloadTask_withInt_withInt_(self, outer$, capture$0, capture$1);
  return self;
}

@end

void ImActorModelModulesFileDownloadTask_$2_initWithImActorModelModulesFileDownloadTask_withInt_withInt_(ImActorModelModulesFileDownloadTask_$2 *self, ImActorModelModulesFileDownloadTask *outer$, jint capture$0, jint capture$1) {
  self->this$0_ = outer$;
  self->val$blockIndex_ = capture$0;
  self->val$fileOffset_ = capture$1;
  (void) NSObject_init(self);
}

ImActorModelModulesFileDownloadTask_$2 *new_ImActorModelModulesFileDownloadTask_$2_initWithImActorModelModulesFileDownloadTask_withInt_withInt_(ImActorModelModulesFileDownloadTask *outer$, jint capture$0, jint capture$1) {
  ImActorModelModulesFileDownloadTask_$2 *self = [ImActorModelModulesFileDownloadTask_$2 alloc];
  ImActorModelModulesFileDownloadTask_$2_initWithImActorModelModulesFileDownloadTask_withInt_withInt_(self, outer$, capture$0, capture$1);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesFileDownloadTask_$2)

@implementation ImActorModelModulesFileDownloadTask_$2_$1

- (void)run {
  this$0_->this$0_->downloaded_++;
  if (this$0_->this$0_->LOG_) {
    AMLog_dWithNSString_withNSString_(this$0_->this$0_->TAG_, JreStrcat("$I$", @"Download part #", this$0_->val$blockIndex_, @" completed"));
  }
  if (![((id<AMOutputFile>) nil_chk(this$0_->this$0_->outputFile_)) writeWithOffset:this$0_->val$fileOffset_ withData:val$data_ withDataOffset:0 withDataLen:((IOSByteArray *) nil_chk(val$data_))->size_]) {
    ImActorModelModulesFileDownloadTask_reportError(this$0_->this$0_);
    return;
  }
  this$0_->this$0_->currentDownloads_--;
  ImActorModelModulesFileDownloadTask_reportProgressWithFloat_(this$0_->this$0_, this$0_->this$0_->downloaded_ / (jfloat) this$0_->this$0_->blocksCount_);
  ImActorModelModulesFileDownloadTask_checkQueue(this$0_->this$0_);
}

- (instancetype)initWithImActorModelModulesFileDownloadTask_$2:(ImActorModelModulesFileDownloadTask_$2 *)outer$
                                                 withByteArray:(IOSByteArray *)capture$0 {
  ImActorModelModulesFileDownloadTask_$2_$1_initWithImActorModelModulesFileDownloadTask_$2_withByteArray_(self, outer$, capture$0);
  return self;
}

@end

void ImActorModelModulesFileDownloadTask_$2_$1_initWithImActorModelModulesFileDownloadTask_$2_withByteArray_(ImActorModelModulesFileDownloadTask_$2_$1 *self, ImActorModelModulesFileDownloadTask_$2 *outer$, IOSByteArray *capture$0) {
  self->this$0_ = outer$;
  self->val$data_ = capture$0;
  (void) NSObject_init(self);
}

ImActorModelModulesFileDownloadTask_$2_$1 *new_ImActorModelModulesFileDownloadTask_$2_$1_initWithImActorModelModulesFileDownloadTask_$2_withByteArray_(ImActorModelModulesFileDownloadTask_$2 *outer$, IOSByteArray *capture$0) {
  ImActorModelModulesFileDownloadTask_$2_$1 *self = [ImActorModelModulesFileDownloadTask_$2_$1 alloc];
  ImActorModelModulesFileDownloadTask_$2_$1_initWithImActorModelModulesFileDownloadTask_$2_withByteArray_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesFileDownloadTask_$2_$1)

@implementation ImActorModelModulesFileDownloadTask_$2_$2

- (void)run {
  if (this$0_->this$0_->LOG_) {
    AMLog_dWithNSString_withNSString_(this$0_->this$0_->TAG_, JreStrcat("$I$", @"Download part #", this$0_->val$blockIndex_, @" failure"));
  }
  ImActorModelModulesFileDownloadTask_reportError(this$0_->this$0_);
}

- (instancetype)initWithImActorModelModulesFileDownloadTask_$2:(ImActorModelModulesFileDownloadTask_$2 *)outer$ {
  ImActorModelModulesFileDownloadTask_$2_$2_initWithImActorModelModulesFileDownloadTask_$2_(self, outer$);
  return self;
}

@end

void ImActorModelModulesFileDownloadTask_$2_$2_initWithImActorModelModulesFileDownloadTask_$2_(ImActorModelModulesFileDownloadTask_$2_$2 *self, ImActorModelModulesFileDownloadTask_$2 *outer$) {
  self->this$0_ = outer$;
  (void) NSObject_init(self);
}

ImActorModelModulesFileDownloadTask_$2_$2 *new_ImActorModelModulesFileDownloadTask_$2_$2_initWithImActorModelModulesFileDownloadTask_$2_(ImActorModelModulesFileDownloadTask_$2 *outer$) {
  ImActorModelModulesFileDownloadTask_$2_$2 *self = [ImActorModelModulesFileDownloadTask_$2_$2 alloc];
  ImActorModelModulesFileDownloadTask_$2_$2_initWithImActorModelModulesFileDownloadTask_$2_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesFileDownloadTask_$2_$2)
