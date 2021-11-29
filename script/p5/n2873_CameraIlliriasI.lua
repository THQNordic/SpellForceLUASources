-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 372.823273 , 196.781357 , 43.580437 , 14.900021 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 392.140900 , 197.764114 , 43.580437 , 7.499995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 402.324585 , 202.462112 , 43.580437 , 10.600004 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 414.076782 , 205.774445 , 43.580437 , 12.800013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 416.202545 , 216.466415 , 43.580437 , 14.800020 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
