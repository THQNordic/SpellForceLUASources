-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 253.529892 , 388.232697 , 45.116402 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(269.178,405.253,28.000);]] )
   Camera:MotionSpline_AddSplinePoint( 261.315338 , 384.997223 , 45.116402 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 269.093842 , 381.764618 , 45.116402 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 276.894470 , 378.522797 , 45.116402 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
