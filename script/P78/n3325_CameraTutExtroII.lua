-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 289.325470 , 254.081848 , 40.645489 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3325);]] )
   Camera:MotionSpline_AddSplinePoint( 280.156097 , 250.002899 , 40.755489 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 270.000214 , 245.928528 , 40.905491 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 263.674866 , 243.775177 , 40.895477 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 31.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
