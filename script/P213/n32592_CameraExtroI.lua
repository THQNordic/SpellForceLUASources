-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 639.556763 , 330.928253 , 47.019585 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(618.167,330.902,48.200);]] )
   Camera:MotionSpline_AddSplinePoint( 639.556763 , 330.928253 , 47.019585 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.1);]] )
   Camera:MotionSpline_AddSplinePoint( 639.556763 , 330.928253 , 47.019585 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(618.639,338.862,42.000);]] )
   Camera:MotionSpline_AddSplinePoint( 639.556763 , 330.928253 , 47.019585 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
