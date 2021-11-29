-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 276.925201 , 211.019363 , 14.285284 , 19.800039 , [[Camera:ScriptSplineLookAtPosition(274.516,213.577,14.500);]] )
   Camera:MotionSpline_AddSplinePoint( 277.861176 , 212.900558 , 14.195221 , 15.700024 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 277.027283 , 215.904816 , 14.116226 , 19.700039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 275.810516 , 215.831345 , 14.735332 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
