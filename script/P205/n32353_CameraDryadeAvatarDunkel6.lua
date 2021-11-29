-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 316.865753 , 384.616699 , 19.091080 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 319.858337 , 384.406281 , 19.091080 , 10.400003 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.199738 , 387.908722 , 19.091080 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.343994 , 397.349854 , 19.091080 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
