-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 394.945679 , 265.870239 , 28.077841 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 397.632874 , 267.020020 , 28.077841 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 399.916138 , 268.909821 , 28.077841 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 399.666779 , 271.059479 , 28.077841 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
   