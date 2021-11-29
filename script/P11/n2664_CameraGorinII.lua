-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 566.171143 , 421.677979 , 39.596497 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(571.326,453.878,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 551.753235 , 423.306885 , 42.356499 , 7.099996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 542.683411 , 439.940460 , 39.406494 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 548.316956 , 451.196655 , 36.896561 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
