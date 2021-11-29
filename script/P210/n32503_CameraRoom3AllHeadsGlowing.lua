-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 449.900421 , 523.319031 , 42.667877 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(449.776,574.226,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 449.902618 , 520.319031 , 42.667877 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 449.904816 , 518.319031 , 42.667877 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 449.907013 , 515.319031 , 42.667877 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
