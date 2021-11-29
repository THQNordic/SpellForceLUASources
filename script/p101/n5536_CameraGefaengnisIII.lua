-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 358.176697 , 191.197113 , 34.547382 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(7011);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2);]] )
   Camera:MotionSpline_AddSplinePoint( 356.633362 , 190.491028 , 34.707382 , 8.899998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 354.576202 , 189.360367 , 34.557384 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 352.847809 , 187.880661 , 34.050465 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
