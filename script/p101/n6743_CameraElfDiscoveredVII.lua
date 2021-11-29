-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 562.593750 , 221.177917 , 13.037676 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(571.675,228.677,10.000);]] )
   Camera:MotionSpline_AddSplinePoint( 566.875488 , 217.355957 , 13.037676 , 11.600008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 571.836548 , 216.008087 , 13.037676 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 579.485779 , 217.254150 , 13.037676 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
