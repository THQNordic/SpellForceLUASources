-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 1 )
   Camera:MotionSpline_SetSlowDown( 2.000000 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 447.783386 , 180.972000 , 142.523102 )
   Camera:MotionSpline_AddSplinePoint( 419.494904 , 173.431320 , 108.544922 )
   Camera:MotionSpline_AddSplinePoint( 400.014160 , 134.439972 , 29.949308 )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
