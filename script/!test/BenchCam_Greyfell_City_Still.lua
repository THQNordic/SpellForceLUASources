-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 628.976074 , 434.672699 , 82.247574 , 0.000000 , [[Camera:ScriptSplineCreateCutScene(632.721,435.695,83.211,631.785,435.439,81.970,5);
Camera:ScriptSplineCreateCutScene(605.839,441.740,60.000,604.847,441.671,59.887,5);
Camera:ScriptSplineCreateCutScene(579.166,413.952,63.250,579.369,412.974,63.203,5);
Camera:ScriptSplineCreateCutScene(614.089,276.888,63.043,613.381,277.593,61.996,5);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
