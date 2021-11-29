-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 432.253326 , 271.621338 , 51.338444 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(457.713,277.411,35.000);]] )
   Camera:MotionSpline_AddSplinePoint( 437.211243 , 260.513824 , 45.368443 , 9.400000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 443.396942 , 257.810333 , 41.708450 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 452.198212 , 257.644348 , 38.677803 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
