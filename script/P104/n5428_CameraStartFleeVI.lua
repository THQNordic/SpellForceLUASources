-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 599.389709 , 143.234665 , 58.157696 , 24.900059 , [[Camera:ScriptSplineLookAtPosition(551.990,201.017,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 619.809387 , 175.684433 , 57.937645 , 14.900021 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 611.881287 , 206.297607 , 58.777676 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 586.421753 , 245.628128 , 58.328392 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
