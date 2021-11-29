-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 371.689453 , 260.381012 , 27.341421 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10466);]] )
   Camera:MotionSpline_AddSplinePoint( 371.689453 , 260.381012 , 27.341421 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10466);]] )
   Camera:MotionSpline_AddSplinePoint( 371.689453 , 260.381012 , 27.341421 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10466);]] )
   Camera:MotionSpline_AddSplinePoint( 371.689453 , 260.381012 , 27.341421 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10466);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
