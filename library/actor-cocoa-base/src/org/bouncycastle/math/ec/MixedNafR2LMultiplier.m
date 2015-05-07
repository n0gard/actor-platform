//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/math/ec/MixedNafR2LMultiplier.java
//


#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/math/ec/AbstractECMultiplier.h"
#include "org/bouncycastle/math/ec/ECCurve.h"
#include "org/bouncycastle/math/ec/ECPoint.h"
#include "org/bouncycastle/math/ec/MixedNafR2LMultiplier.h"
#include "org/bouncycastle/math/ec/WNafUtil.h"

@implementation OrgBouncycastleMathEcMixedNafR2LMultiplier

- (instancetype)init {
  OrgBouncycastleMathEcMixedNafR2LMultiplier_init(self);
  return self;
}

- (instancetype)initWithInt:(jint)additionCoord
                    withInt:(jint)doublingCoord {
  OrgBouncycastleMathEcMixedNafR2LMultiplier_initWithInt_withInt_(self, additionCoord, doublingCoord);
  return self;
}

- (OrgBouncycastleMathEcECPoint *)multiplyPositiveWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)p
                                                            withJavaMathBigInteger:(JavaMathBigInteger *)k {
  OrgBouncycastleMathEcECCurve *curveOrig = [((OrgBouncycastleMathEcECPoint *) nil_chk(p)) getCurve];
  OrgBouncycastleMathEcECCurve *curveAdd = [self configureCurveWithOrgBouncycastleMathEcECCurve:curveOrig withInt:additionCoord_];
  OrgBouncycastleMathEcECCurve *curveDouble = [self configureCurveWithOrgBouncycastleMathEcECCurve:curveOrig withInt:doublingCoord_];
  IOSIntArray *naf = OrgBouncycastleMathEcWNafUtil_generateCompactNafWithJavaMathBigInteger_(k);
  OrgBouncycastleMathEcECPoint *Ra = [((OrgBouncycastleMathEcECCurve *) nil_chk(curveAdd)) getInfinity];
  OrgBouncycastleMathEcECPoint *Td = [((OrgBouncycastleMathEcECCurve *) nil_chk(curveDouble)) importPointWithOrgBouncycastleMathEcECPoint:p];
  jint zeroes = 0;
  for (jint i = 0; i < ((IOSIntArray *) nil_chk(naf))->size_; ++i) {
    jint ni = IOSIntArray_Get(naf, i);
    jint digit = RShift32(ni, 16);
    zeroes += ni & (jint) 0xFFFF;
    Td = [((OrgBouncycastleMathEcECPoint *) nil_chk(Td)) timesPow2WithInt:zeroes];
    OrgBouncycastleMathEcECPoint *Tj = [curveAdd importPointWithOrgBouncycastleMathEcECPoint:Td];
    if (digit < 0) {
      Tj = [((OrgBouncycastleMathEcECPoint *) nil_chk(Tj)) negate];
    }
    Ra = [((OrgBouncycastleMathEcECPoint *) nil_chk(Ra)) addWithOrgBouncycastleMathEcECPoint:Tj];
    zeroes = 1;
  }
  return [((OrgBouncycastleMathEcECCurve *) nil_chk(curveOrig)) importPointWithOrgBouncycastleMathEcECPoint:Ra];
}

- (OrgBouncycastleMathEcECCurve *)configureCurveWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)c
                                                                         withInt:(jint)coord {
  if ([((OrgBouncycastleMathEcECCurve *) nil_chk(c)) getCoordinateSystem] == coord) {
    return c;
  }
  if (![c supportsCoordinateSystemWithInt:coord]) {
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I$", @"Coordinate system ", coord, @" not supported by this curve"));
  }
  return [((OrgBouncycastleMathEcECCurve_Config *) nil_chk([((OrgBouncycastleMathEcECCurve_Config *) nil_chk([c configure])) setCoordinateSystemWithInt:coord])) create];
}

@end

void OrgBouncycastleMathEcMixedNafR2LMultiplier_init(OrgBouncycastleMathEcMixedNafR2LMultiplier *self) {
  (void) OrgBouncycastleMathEcMixedNafR2LMultiplier_initWithInt_withInt_(self, OrgBouncycastleMathEcECCurve_COORD_JACOBIAN, OrgBouncycastleMathEcECCurve_COORD_JACOBIAN_MODIFIED);
}

OrgBouncycastleMathEcMixedNafR2LMultiplier *new_OrgBouncycastleMathEcMixedNafR2LMultiplier_init() {
  OrgBouncycastleMathEcMixedNafR2LMultiplier *self = [OrgBouncycastleMathEcMixedNafR2LMultiplier alloc];
  OrgBouncycastleMathEcMixedNafR2LMultiplier_init(self);
  return self;
}

void OrgBouncycastleMathEcMixedNafR2LMultiplier_initWithInt_withInt_(OrgBouncycastleMathEcMixedNafR2LMultiplier *self, jint additionCoord, jint doublingCoord) {
  (void) OrgBouncycastleMathEcAbstractECMultiplier_init(self);
  self->additionCoord_ = additionCoord;
  self->doublingCoord_ = doublingCoord;
}

OrgBouncycastleMathEcMixedNafR2LMultiplier *new_OrgBouncycastleMathEcMixedNafR2LMultiplier_initWithInt_withInt_(jint additionCoord, jint doublingCoord) {
  OrgBouncycastleMathEcMixedNafR2LMultiplier *self = [OrgBouncycastleMathEcMixedNafR2LMultiplier alloc];
  OrgBouncycastleMathEcMixedNafR2LMultiplier_initWithInt_withInt_(self, additionCoord, doublingCoord);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcMixedNafR2LMultiplier)
