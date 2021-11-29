-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 261.597687 , 443.270813 , 22.203287 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(233.098,444.577,14.950);]] )
   Camera:MotionSpline_AddSplinePoint( 260.475342 , 448.408203 , 20.331682 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 259.344818 , 453.635223 , 19.171640 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 255.394287 , 458.778290 , 19.683342 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
