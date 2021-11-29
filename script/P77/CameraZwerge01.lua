-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 127.074478 , 291.664246 , 43.476402 , 50.099808 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 189.812820 , 287.700867 , 61.116402 , 27.000067 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 235.567993 , 289.201874 , 56.133842 , 49.999809 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 342.572845 , 287.666412 , 48.646400 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 55.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
