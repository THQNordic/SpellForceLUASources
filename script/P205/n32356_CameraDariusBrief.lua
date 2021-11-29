-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 316.805023 , 394.765015 , 16.752686 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(318.839,397.944,43.751);

Camera:ScriptSplineLookAtApproachingModifier(0.03);]] )
   Camera:MotionSpline_AddSplinePoint( 317.020325 , 395.350494 , 19.752686 , 1.600000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.01);
]] )
   Camera:MotionSpline_AddSplinePoint( 316.183411 , 395.958466 , 21.752686 , 1.900000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.01);Camera:ScriptSplineLookAtPosition(349.846,422.188,27.828);Camera:ScriptSplineLookAtPosition(340.011,415.732,23.231);]] )
   Camera:MotionSpline_AddSplinePoint( 315.499298 , 396.927856 , 23.752686 , 2.600000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.03);
Camera:ScriptSplineLookAtPosition(330.506,415.652,21.727);]] )
   Camera:MotionSpline_AddSplinePoint( 315.710815 , 396.599213 , 24.926317 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(360.878,435.253,20.147);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 317.387451 , 396.779541 , 26.075014 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(<MODIFIER[0..1]>);]] )
   Camera:MotionSpline_AddSplinePoint( 320.463379 , 392.675934 , 26.750525 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(<MODIFIER[0..1]>);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
