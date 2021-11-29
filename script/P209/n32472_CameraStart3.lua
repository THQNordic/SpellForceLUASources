-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 201.298981 , 377.080048 , 42.386402 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(398.498,372.885,14.420);]] )
   Camera:MotionSpline_AddSplinePoint( 256.426086 , 366.268463 , 40.986401 , 6.599996 , [[Camera:ScriptSplineLookAtPosition(398.498,372.885,14.420);]] )
   Camera:MotionSpline_AddSplinePoint( 298.900879 , 387.148804 , 40.926689 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(398.498,372.885,14.420);]] )
   Camera:MotionSpline_AddSplinePoint( 324.204254 , 378.045959 , 41.676399 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(398.498,372.885,14.420);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 1.054688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
