-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 585.680786 , 390.685760 , 34.336903 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(610.837,401.801,25.000);]] )
   Camera:MotionSpline_AddSplinePoint( 587.561157 , 387.109894 , 34.426903 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 590.093262 , 383.989105 , 34.536903 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 595.182739 , 380.789978 , 34.886902 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
