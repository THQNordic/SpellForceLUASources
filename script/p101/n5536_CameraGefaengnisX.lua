-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 473.180542 , 332.418060 , 21.557659 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(492.232,345.263,20.500);]] )
   Camera:MotionSpline_AddSplinePoint( 474.522308 , 331.101044 , 21.527658 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 475.862122 , 329.776489 , 21.457661 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 477.198273 , 328.465057 , 21.277658 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
