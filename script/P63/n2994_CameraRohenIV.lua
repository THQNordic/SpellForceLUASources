-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 185.376862 , 355.013947 , 33.318371 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(2994);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 197.385361 , 352.907043 , 32.318371 , 7.699995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 199.036896 , 343.617981 , 35.668369 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 196.726379 , 340.312653 , 40.468369 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
