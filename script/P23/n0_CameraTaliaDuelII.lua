-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 567.344604 , 269.458435 , 29.868614 , 24.900059 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 572.604858 , 269.866455 , 30.321678 , 13.500015 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 581.673157 , 271.296967 , 31.351677 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 593.580627 , 273.314301 , 31.348618 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
