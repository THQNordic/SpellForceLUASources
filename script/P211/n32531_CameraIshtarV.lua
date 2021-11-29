-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 363.519104 , 258.949249 , 28.726730 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 364.412048 , 259.229553 , 28.726730 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 365.713593 , 259.638062 , 28.726730 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 366.757141 , 259.965607 , 28.726730 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
