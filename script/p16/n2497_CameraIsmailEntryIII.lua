-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 478.310760 , 565.843262 , 49.913223 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(2497);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 481.155975 , 561.436218 , 51.873779 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 485.797302 , 562.808655 , 56.893219 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 484.910828 , 567.689148 , 61.803284 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
