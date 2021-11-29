-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 457.595734 , 249.579880 , 23.535032 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9895);]] )
   Camera:MotionSpline_AddSplinePoint( 457.590912 , 228.579880 , 26.535032 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 457.447357 , 222.583344 , 27.535032 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 457.063507 , 212.592590 , 27.535032 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
