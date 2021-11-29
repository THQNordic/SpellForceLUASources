-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 269.376038 , 185.826431 , 27.280931 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 267.548157 , 185.882309 , 27.380932 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 266.245392 , 185.980591 , 27.090933 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 264.591309 , 186.176956 , 27.050934 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
